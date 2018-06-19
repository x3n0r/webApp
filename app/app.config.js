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
    }
  ]);
