/* */

console.log("JS-RELOADED");

var clearProgress = function() {
  var foundProgressContainer = document.getElementById("progress");
  if (foundProgressContainer) {
    foundProgressContainer.parentNode.removeChild(foundProgressContainer);
  }
};

var indicateProgress = function() {
  clearProgress();

  var progressIndicator = document.createElement("progress");
  var progressContainer = document.createElement("div");
  progressContainer.id = "progress";
  progressContainer.appendChild(progressIndicator);
  document.body.appendChild(progressContainer);
}

var resetTimeout = function() {
  if (typeof(window.morphdomTimeout) != "undefined") {
    clearTimeout(window.morphdomTimeout);
  }
};

var keepTimeout = function(dashboardContainer) {
  resetTimeout();

  window.morphdomTimeout = setTimeout(() => {
    refreshIndex(dashboardContainer);
  }, 1000);
};

var refreshIndex = function(dashboardContainer) {
  var searchParams = new URLSearchParams(window.location.search);

  //TODO: abstract data loader / router
  fetch('?p=1' + '&max_r=' + (searchParams.get("max_r") || '')) // + '&c=' + (searchParams.get("c") || ''))
  .then(response => {
    clearProgress();

    return response.text()
  })
  .then(dashboardHtml => {
    morphdom(dashboardContainer, dashboardHtml, {
      childrenOnly: true,
      //onBeforeElUpdated: function(fromEl, toEl) {
      //  if (fromEl.isEqualNode(toEl)) {
      //    return false
      //  }
      //  return true
      //},
      onNodeAdded: function (node) {
        if (node.nodeName === 'SCRIPT') {
          var script = document.createElement('script');
          //copy over the attributes
          [...node.attributes].forEach( attr => { script.setAttribute(attr.nodeName ,attr.nodeValue) })

          script.innerHTML = node.innerHTML;
          node.replaceWith(script)
        }
      },
      onBeforeElUpdated: function (fromEl, toEl) {
        if (fromEl.nodeName === "SCRIPT" && toEl.nodeName === "SCRIPT") {
          if (fromEl.id != toEl.id) { //TODO: maybe force JC reload??
            var script = document.createElement('script');
            //copy over the attributes
            [...toEl.attributes].forEach( attr => { script.setAttribute(attr.nodeName ,attr.nodeValue) })

            script.innerHTML = toEl.innerHTML;
            fromEl.replaceWith(script)
            return false;
          }
        }
        return true;
      }
    });

    keepTimeout(dashboardContainer);
  })
  .catch(e => {
    resetTimeout();
    indicateProgress();
    setTimeout(() => {
      refreshIndex(dashboardContainer);
    }, 1000);

    console.log('There has been a problem with your fetch operation: (' + e.message + ') -- reconnecting, please wait...');
  });
};

var installMorphdom = function() {
  var foundDc = document.getElementById("container")
  refreshIndex(foundDc);
};

if (typeof(window.morphdomInstalled) === "undefined") {
  window.addEventListener('DOMContentLoaded', (contentLoadedEvent) => {
    console.log("DOMContentLoaded");
    installMorphdom();
  });
  window.morphdomInstalled = true;
} else {
  installMorphdom();
}
