'use strict'

angular
.module("myApp",
  ['ngRoute', 'ui.router', 'main.controller', 'week.service', 'mainPanelTe.directive',
   'dayPanel.directive', "ngAnimate", 'anim-in-out', 'ui.bootstrap', 'saveEventModal.controller', 'storage.service',
   'weekPanel.directive', 'event.directive', 'updateEventModal.controller', 'week.factory'])
.config ["$stateProvider", "$urlRouterProvider",
  ($stateProvider, $urlRouterProvider) ->

    template = '<div ng-repeat="day in week">' + '<daypanel date="day"></daypanel>' + '</div>'

    $stateProvider.state 'week',
      url: "/:week/:year"
      template: template
      controller: ($scope) ->
]


