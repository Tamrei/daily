'use strict'

class WeekService
  constructor: () ->

  getWeek: (weekNumb, yearNumb) ->
    firstDayOfTheYear = new Date(yearNumb, 0, 1)

    daysFromLastYear = firstDayOfTheYear.getDay()

    firstDayOfThisWeek = new Date(firstDayOfTheYear)
    firstDayOfThisWeek.setDate(firstDayOfTheYear.getDate() - daysFromLastYear + (7 * weekNumb))

    thisWeekDay = new Date(firstDayOfThisWeek)

    for i in [1..7]
      date = thisWeekDay
      date.setDate(date.getDate() + 1)
      new Date(date)


  getWeekNumberByDate: (day, month, year) ->
    firstDayOfTheYear = new Date(year, 0, 1)
    requestedDate = new Date(year, month, day)

    thisYearDays = Math.round((requestedDate - firstDayOfTheYear) / (1000 * 60 * 60 * 24))
    daysFromTheLastYear = firstDayOfTheYear.getDay()

    totalDays = thisYearDays + daysFromTheLastYear

    result = totalDays / 7

    if (result < 1)
      0
    else
      result | 0

  getCurrentWeekNumber: () ->
    today = new Date()
    @getWeekNumberByDate(today.getDate(), today.getMonth() , today.getFullYear())

  getWeeksInYear: (year) ->
    lastDayOfYear = new Date(year, 12 - 1, 31);
    if lastDayOfYear.getDay() is 6
      52
    else
      51

  getKey: (date) ->
    date.getMonth() + 1 + "." + date.getDate() + "." + date.getFullYear()

  getEvents: (date) ->
    JSON.parse localStorage.getItem @getKey(date)

angular
.module('week.service', [])
.service('weekService', WeekService)
