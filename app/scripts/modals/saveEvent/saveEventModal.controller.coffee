'use strict'

class @SaveModalController
  constructor: ($scope, $uibModalInstance, storageService, date) ->

    $scope.save = () ->
      storageService.saveEvent(storageService.getKey(date), $scope.event)
      $uibModalInstance.close()

    $scope.close = () ->
      $uibModalInstance.dismiss('cancel')

SaveModalController.$inject =["$scope", "$uibModalInstance", "storageService", "date"]

angular.module("saveEventModal.controller", [])
.controller("saveEventModalController", SaveModalController)