'use strict'

class Event

  scope: {
    event: '='
    index: '@'
    date: '='
  }
  transclude: true
  restrict: 'E'
  templateUrl: 'scripts/directives/event/event.template.html'
  controller: ($scope, $rootScope, $uibModal, $element, weekService) -> new EventController($scope, $rootScope,
    $uibModal, $element, weekService)

Event.$inject = ["weekService"];

angular
.module('event.directive', [])
.directive 'event', -> new Event()


