## =============================== License ========================================
## ================================================================================
## This work is distributed under the CC0 1.0 Universal (CC0 1.0) license, included in the parent directory
## Copyright Owner: University of Oxford
## Date of Authorship: 2016
## Author: Martin John Hadley (orcid.org/0000-0002-3039-6849)
## ================================================================================


## ==== Check URL for allowPopout using https://github.com/daattali/advanced-shiny/tree/master/url-inputs
## ==== DEFAULT BEHAVIOUR: no popout button is show
## ==== shinyapp/?allowPopout=TRUE: a popout button is shown align-right in the navbar

url_allowPopout_check <-
  eventReactive(session$clientData$url_search,
                {
                  query <- parseQueryString(session$clientData$url_search)
                  if (!is.null(query[['allowPopout']])) {
                    if (toupper(query[['allowPopout']]) == "TRUE") {
                      TRUE
                    } else
                      FALSE
                  } else
                    FALSE
                })

## Generate popout icon, default gyphicon dependent on bootstrap
url_allowPopout_icon <-
  function(glyph = "<span class=\"glyphicon glyphicon-fullscreen\" aria-hidden=\"true\" style=\"color:black;padding:2px;border:1px solid;border-radius:3px;\">",
           text = " Popout",
           link = session$clientData$url_pathname) {
    HTML(
      paste0(
        "<script>var parent = document.getElementsByClassName('navbar-nav');parent[0].insertAdjacentHTML( 'afterend', '<ul class=\"nav navbar-nav navbar-right\"><li><a href=\"",
        link,
        "\" target=\"_blank\">",
        glyph,
        "</span>",
        "<span>",
        text,
        "</span></a></li></ul>' );</script>"
      )
    )
  }

output$url_allow_popout_UI <- renderUI({
  if (url_allowPopout_check() == TRUE) {
    url_allowPopout_icon()
  }
})
