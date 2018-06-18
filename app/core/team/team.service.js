'use strict';

angular.
  module('core.team').
  factory('Team', [ '$resource', function($resource) {
		return { 
			query: function(p1) {
				return $resource('matches/teams/:teamId.json', {}, {
					query: {
						method: 'GET',
						params: {teamId: p1},
						isArray: false
					}
				}).query();
			}
		}}
  ]);
