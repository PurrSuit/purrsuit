angular.module('starter.services', ['ngResource'])

// REST services
.factory('Api', function($resource){
  return{

    Quest: $resource('http://localhost:3000/quests/all.json',
    {method: 'getQuest', q: '*'},
    {'query': {method: 'GET'}, isArray:true}
  ),

    User: $resource('http://localhost:3000/users/all',
      {q: '*'},
      {'query': {method: 'GET'}, isArray:true}
    )
  }
});
