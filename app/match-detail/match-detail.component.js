'use strict';

// Register `matchDetail` component, along with its associated controller and template
angular.
  module('matchDetail').
  component('matchDetail', {
    templateUrl: 'match-detail/match-detail.template.html',
    controller: ['$routeParams', 'Match',
      function MatchDetailController($routeParams, Match) {
        var self = this;
        self.match = Match.get({matchId: $routeParams.matchId}, function(match) {
          self.setImage(match.images[0]);
        });

        self.setImage = function setImage(imageUrl) {
          self.mainImageUrl = imageUrl;
        };
      }
    ]
  });
