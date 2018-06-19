'use strict';

// Register `tabs` component, along with its associated controller and template
angular.
  module('tabs').
  component('tabs', {
    templateUrl: 'tabs/tabs.template.html',
	controller: function TabsController($scope) {
		$scope.tab = 1;
	
		$scope.setTab = function(newTab){
			$scope.tab = newTab;
		};
	
		$scope.isSet = function(tabNum){
			return $scope.tab === tabNum;
		};
      }
});

