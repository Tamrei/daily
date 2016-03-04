'use strict'

class @UpdateModalController
  constructor: ($scope, $rootScope, $uibModalInstance, storageService, date, index, eventToUpd) ->

    $scope.event = eventToUpd

    $scope.update = () ->
      storageService.updateEvent(storageService.getKey(date), $scope.event, index)
      $uibModalInstance.close()

    $scope.deleteEvent = () ->
      del = confirm("are you sure you wanna delete this event")
      if del is true
        storageService.deleteEvent(storageService.getKey(date), index)
        $uibModalInstance.close()

    $scope.close = () ->
      $rootScope.isUpdateModalOpened = false
      $uibModalInstance.dismiss('cancel')

UpdateModalController.$inject =["$scope", "$rootScope", "$uibModalInstance", "storageService", "date", 'index', 'eventToUpd']

angular.module("updateEventModal.controller", [])
.controller("updateEventModalController", UpdateModalController)