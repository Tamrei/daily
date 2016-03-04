'use strict'

class MainPanel

  transclude: true
  restrict: 'E'
  templateUrl: 'scripts/directives/mainPanel/mainPanel.template.html'
  controller: ()-> new Controller()

angular
.module('mainPanelTe.directive', [])
.directive 'mainpanel', -> new MainPanel()


