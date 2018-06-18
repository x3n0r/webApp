'use strict';

angular.
  module('core.match').
  factory('Match', ['$resource',
    function($resource) {
      return $resource('matches/matches/:matchId.json', {}, {
        query: {
          method: 'GET',
          params: {matchId: 'matches'},
          isArray: true
        }
      });
    }
  ]);
