/* */

window.addEventListener('DOMContentLoaded', (contentLoadedEvent) => {
  var dashboardContainer = document.getElementById("container")

  var indicateProgress = function(element) {
    var progressIndicator = document.createElement("progress");

    while (element.firstChild) {
      element.removeChild(element.firstChild);
    }

    element.appendChild(progressIndicator);
  };

  var refreshIndex = function(firstTime) {
    if(firstTime) {
      //indicateProgress(dashboardContainer);
      setTimeout(refreshIndex, 100);
      return;
    }

    var searchParams = new URLSearchParams(window.location.search);

    //TODO: abstract data loader / router
    fetch('?p=1') // + '&pod=' + (searchParams.get("pod") || '') + '&c=' + (searchParams.get("c") || ''))
    .then(response => {
      return response.text()
    })
    .then(dashboardHtml => {
      morphdom(dashboardContainer, dashboardHtml, {
        childrenOnly: true,
        onBeforeElUpdated: function(fromEl, toEl) {
          if (fromEl.isEqualNode(toEl)) {
            return false
          }

          return true
        }
      });

      setTimeout(refreshIndex, 1000);
    })
    .catch(e => {
      console.log('There has been a problem with your fetch operation: ' + e.message);
      indicateProgress(dashboardContainer);
    });
  };

  refreshIndex(true);
});
