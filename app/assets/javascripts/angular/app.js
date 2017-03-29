(function(angular) {
    'use strict';
    angular.module('docsTemplateUrlDirective', [])
        .controller('Controller', ['$scope', function($scope) {
            $scope.customer = {
                name: 'test',
                address: 'testeesst'
            };
        }])
        .directive('myCustomer', function() {

            return {
                restrict : 'E',
                templateUrl: "<%= asset_path('routeList.html') %>"
            };
        });
})(window.angular);