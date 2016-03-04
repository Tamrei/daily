'use strict'

class StorageService
  constructor: () ->

  updateEvent: (key, newEvent, index) ->
    eventArray = JSON.parse localStorage.getItem key
    eventArray[index] = newEvent
    localStorage.setItem key, JSON.stringify eventArray

  saveEvent: (key, event) ->
    if localStorage.getItem(key) is null
      eventArray = []
      eventArray.push(event)
      localStorage.setItem key, JSON.stringify eventArray
    else
      eventArray = JSON.parse localStorage.getItem key
      eventArray.push event
      localStorage.setItem key, JSON.stringify eventArray

  deleteEvent: (key, index) ->
    eventArray = JSON.parse localStorage.getItem key
    eventArray.splice index, 1
    localStorage.setItem key, JSON.stringify eventArray

  getKey: (date) ->
    date.getMonth() + 1 + "." + date.getDate() + "." + date.getFullYear();

angular
.module('storage.service', [])
.service('storageService', StorageService)
