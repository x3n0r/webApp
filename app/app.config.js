'use strict';

angular.
  module('matchcatApp').
  config(['$locationProvider' ,'$routeProvider',
    function config($locationProvider, $routeProvider) {
      $locationProvider.hashPrefix('!');

      $routeProvider.
        when('/matches', {
          template: '<match-list></match-list>'
        }).
        otherwise('/matches');
		/*
	   $routeProvider.
        when('/matches', {
          template: '<match-list></match-list>'
        }).
        when('/matches/:matchId', {
          template: '<match-detail></match-detail>'
        }).
        otherwise('/matches');*/
    }
  ]);
