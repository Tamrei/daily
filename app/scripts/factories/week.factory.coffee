'use strict'

class @WeekFactory
  constructor: (weekService) ->


WeekFactory.$inject = ['weekService']

angular
.module('week.factory', [])
.service('weekFactory', WeekFactory)
