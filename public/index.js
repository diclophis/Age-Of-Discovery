/* */

console.log("JS REINTERP");

//var indicateProgress = function(element) {
//  var progressIndicator = document.createElement("progress");
//
//  while (element.firstChild) {
//    element.removeChild(element.firstChild);
//  }
//
//  element.appendChild(progressIndicator);
//  element.classList.add("progress");
//};

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
    //console.log("resetTimeout");

    clearTimeout(window.morphdomTimeout);
  }
};

var keepTimeout = function(dashboardContainer) {
  //if (typeof(window.morphdomTimeout) != "undefined") {
  //  console.log("clear");
  //  clearTimeout(window.morphdomTimeout);
  //}

  resetTimeout();

  window.morphdomTimeout = setTimeout(() => {
    refreshIndex(dashboardContainer);
  }, 1000);

  //console.log("installedTimeout keptTimeout");
};

var refreshIndex = function(dashboardContainer) {
  var searchParams = new URLSearchParams(window.location.search);

  //TODO: abstract data loader / router
  fetch('?p=1') // + '&pod=' + (searchParams.get("pod") || '') + '&c=' + (searchParams.get("c") || ''))
  .then(response => {
    clearProgress();

    return response.text()
  })
  .then(dashboardHtml => {
    console.log("refreshedIndex");

    //dashboardContainer.classList.remove("progress");

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
    console.log('There has been a problem with your fetch operation: ' + e.message);
    indicateProgress();
    //keepTimeout(dashboardContainer);
    ////setTimeout(refreshIndex, 1000);
    setTimeout(() => {
      refreshIndex(dashboardContainer);
    }, 1000);
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
  console.log(typeof(window.morphdomInstalled));
} else {
  console.log("js reloaded");

  installMorphdom();
}
