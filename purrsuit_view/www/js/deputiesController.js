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

.controller('DeputyCtrl', function($scope, $stateParams, ServerFindDeputy) {
  var findId = $stateParams.deputyId;
  ServerFindDeputy.get({
      id: findId
    },
    function(data) {
      console.log("SERVICES: Getting Deputy (Id: " + findId + ") data from server...");
      $scope.deputy = data.deputy;

      var uf_id_deputy = $scope.deputy.uf_id;
      localStorage.setItem("DeputyUfId", uf_id_deputy);
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

.controller('GetDeputyUf', function($scope, ServerUf){
  var uf_id_local = localStorage.getItem("DeputyUfId");
  $scope.getUf = function() {
    ServerUf.get({
        ufId: uf_id_local
      },
      function(data) {
        console.log("SERVICES: Getting deputy's Uf with Id(" + uf_id_local + ") data from server...")
        $scope.deputyUf = data.uf;
      },
      function(error) {
        console.log("SERVICES: Could not get deputy's Uf with Id(" + uf_id_local + ")");
      })
  }
})
