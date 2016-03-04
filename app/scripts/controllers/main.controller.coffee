'use strict'

class MainController
  constructor: ($scope, $location, $rootScope, $state, $uibModal, weekService, weekFactory) ->
    path = $location.path()

    if path is ""
      $location.path(weekService.getCurrentWeekNumber() + "/" + new Date().getFullYear())

    $scope.nextWeek = () ->
      $scope.weekNumb++;

    $scope.prevWeek = () ->
      $scope.weekNumb--;

    $rootScope.$on '$locationChangeSuccess', () ->
      path = $location.path()

      week = path.match(/[^a-zA-Z!@#\$%\^\&*/]\d{0,1}/)
      year = path.match(/[^a-zA-Z!@#\$%\^\&*/]\d{3}/)

      if (week < 0)
        $location.path(weekService.getWeeksInYear(--year) + "/" + year)

      if (week > 50 && week > weekService.getWeeksInYear(year))
        $location.path(0 + "/" + ++year)

      $rootScope.weekNumb = week
      $rootScope.yearNumb = year[0]

      $rootScope.week = weekService.getWeek(week, year)
      $state.go('week', {week: $scope.weekNumb, year: $scope.yearNumb})


MainController.$inject = ["$scope", "$location", "$rootScope", "$state", "$uibModal", "weekService", "weekFactory"]

angular.module("main.controller", [])
.controller("mainController", MainController)