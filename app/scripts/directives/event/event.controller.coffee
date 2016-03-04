class @EventController
  constructor: ($scope, $rootScope, $uibModal, $element, weekService) ->
    widthOfATimePanel = 735

    fromHour = $scope.event.from.hour
    toHour = $scope.event.to.hour

    fromMinutes = $scope.event.from.minutes / 2
    toMinutes = $scope.event.to.minutes / 2

    startCord =  widthOfATimePanel - ((toHour * 30) + toMinutes)

    endCord = ((toHour - fromHour) * 30) + (toMinutes - fromMinutes)

    $scope.pos = {
      height: endCord + 'px'
      top: startCord + 'px'
    }

    $($element).click (e) ->
      updateEventModal = $uibModal.open
        controller: "updateEventModalController"
        templateUrl: 'updateEventModal.template.html'
        resolve:
          date: () ->
            $scope.date
          index: () ->
            $scope.index
          eventToUpd: () ->
            $scope.event

      updateEventModal.result.then (() ->
        $rootScope.week = weekService.getWeek($rootScope.weekNumb, $rootScope.yearNumb)
      ), ->




