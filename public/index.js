/* */

var defaultPollTimeout = 1000;
var pollTimeout = defaultPollTimeout;

console.log("JS-RELOADED");

var handleErrors = function(response) {
  if (!response.ok) {
      throw Error(response.statusText);
  }
  return response;
}

var mergeAttrs = function(target, source) {
  source.getAttributeNames().forEach(name => {
    let value = source.getAttribute(name)
    target.setAttribute(name, value)
  })
};

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
  }, pollTimeout);
};

var refreshIndex = function(dashboardContainer) {
  var searchParams = new URLSearchParams(window.location.search);

  searchParams.set("p", 1);

  //TODO: abstract data loader / router
  //'?p=1' + '&max_r=' + (searchParams.get("max_r") || '')) // + '&c=' + (searchParams.get("c") || ''))
  fetch('?' + searchParams.toString())
  .then(handleErrors)
  .then(response => {
    clearProgress();
    pollTimeout = defaultPollTimeout;

    return response.text()
  })
  .then(dashboardHtml => {
    morphdom(dashboardContainer, dashboardHtml, {
      childrenOnly: true,
      onNodeAdded: function (node) {
        //if((node.nodeName === "INPUT") && node.type === "TEXT") {
        //console.log("foo");
        //  node.focus();
        //}

        if (node.nodeName === 'SCRIPT') {
          var script = document.createElement('script');
          //copy over the attributes
          [...node.attributes].forEach( attr => { script.setAttribute(attr.nodeName ,attr.nodeValue) })

          script.innerHTML = node.innerHTML;
          node.replaceWith(script)
        }
      },
      onBeforeElUpdated: function (fromEl, toEl) {
        let focused = document.activeElement;

        if (fromEl.className === "focal" && (!!focused || fromEl == focused)) {
          fromEl.focus();
        }

          //if((fromEl.nodeName === "INPUT") && fromEl === focused) {
          if((fromEl.nodeName === "INPUT")) { // && fromEl === focused) {
            mergeAttrs(fromEl, toEl);
            return false;
          } else {
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
        //}
      }
    });

    keepTimeout(dashboardContainer);
  })
  .catch(e => {
    pollTimeout = pollTimeout * 1.5;

    resetTimeout();
    indicateProgress();
    setTimeout(() => {
      refreshIndex(dashboardContainer);
    }, pollTimeout);

    console.log('There has been a problem with your fetch operation: (' + e.message + ') -- attempting reconnect in ' + pollTimeout + 'ms, please wait...');
  });
};

var installMorphdom = function() {
  var foundDc = document.getElementById("wkndr")
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
