angular.module('starter')

.controller('DeputiesCtrl', function($scope, ServerDeputies) {
  ServerDeputies.get(function(data) {
      console.log("SERVICES: Getting Deputies data from server...")
      $scope.deputies = data.deputy;
    },
    function(error) {
      alert("Não foi possível estabelecer conexão com o servidor...");
      console.log("SERVICES: ERROR in getting Deputies data from server...");
    })
})

.controller('DeputyCtrl', function($scope, $stateParams, ServerFindDeputy, ServerUf, ServerParty) {
  var findId = $stateParams.deputyId;

  ServerFindDeputy.get({
      id: findId
    },
    function(data) {
      console.log("SERVICES: Getting Deputy (Id: " + findId + ") data from server...");
      $scope.deputy = data.deputy;

      var deputyPartyId = data.deputy.party_id;
      var deputyUfId = data.deputy.uf_id;

      // UF Data
      ServerUf.get({ufId: deputyUfId}, function(data){
        console.log("SERVICES: Getting deputy's Uf (Id: " + deputyUfId + ") from server...")
        $scope.deputyUf = data.uf;
      },function(error){
        console.log("SERVICES: Could not get UF data from server...")
      })

      //Party data
      ServerParty.get({partyId: deputyPartyId}, function(data){
        console.log("SERVICES: Getting deputy's Party (Id: " + deputyPartyId + ") from server...")
        $scope.deputyParty = data.party;
      },function(error){
        console.log("SERVICES: Could not get Party data from server...")
      })
    },
    function(error) {
      alert("Não foi possível estabelecer conexão com o servidor...");
      console.log("SERVICES: ERROR in getting Deputy (Id: " + findId + ") data from server...");
    }
  )
})

.controller('SearchDeputiesCtrl', function($scope, ServerSearchDeputies) {
  $scope.doSearch = function(inputText) {
    $scope.deputies = [];

    //console.log(inputText.lenght);

    ServerSearchDeputies.get({
        toSearch: inputText
      },
      function(data) {
        console.log("SERVICES: Getting Deputies with text(" + inputText + ") data from server...")

        if (data.deputy.lenght === 0) {
          console.log("Services: Search returned no Deputy")
        }
        else {
          $scope.deputies = data.deputy;
        }
      },
      function(error) {
        alert("Não foi possível estabelecer conexão com o servidor...");
        console.log("SERVICES: ERROR in getting Deputies with text(" + inputText + ") data from server...");
      })
  }
})
