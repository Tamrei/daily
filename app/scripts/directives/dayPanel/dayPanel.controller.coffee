class @DayController
  constructor: ($scope, $rootScope, $element, $attrs, $uibModal, $state, weekService) ->
    $scope.events = weekService.getEvents($scope.date);

    $($element).click (e) ->
      x = e.clientX
      y = e.clientY
      elementMouseIsOver = document.elementFromPoint(x, y)
      if elementMouseIsOver.className.includes "day-panel"
        addEventModal = $uibModal.open
          controller: "saveEventModalController",
          templateUrl: 'saveEventModal.template.html',
          resolve:
            date: () ->
              $scope.date

        addEventModal.result.then (() ->
          $rootScope.week = weekService.getWeek($rootScope.weekNumb, $rootScope.yearNumb)
        ), ->




