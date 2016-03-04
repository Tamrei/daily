'use strict'

class WeekPanel

  restrict: 'E'
  templateUrl: 'scripts/directives/weekPanel/weekPanel.template.html'
  controller: ($scope) -> new WeekPanelController($scope)

angular
.module('weekPanel.directive', [])
.directive 'weekpanel', -> new WeekPanel()


