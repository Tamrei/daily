'use strict'

class DayPanel

  scope: {
    date: "="
  }
  transclude: true
  restrict: 'E'
  templateUrl: 'scripts/directives/dayPanel/dayPanel.template.html'
  controller: ($scope, $rootScope, $element, $attrs, $uibModal, $state, weekService, weekFactory) -> new DayController($scope,
    $rootScope, $element, $attrs, $uibModal, $state, weekService, weekFactory)

DayPanel.$inject = ["weekService", "weekFactory"];

angular
.module('dayPanel.directive', [])
.directive 'daypanel', -> new DayPanel()
