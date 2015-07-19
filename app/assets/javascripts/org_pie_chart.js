var dataPoints = [

                    ];

  function getOrgList() {
      $.get('/admin/org_list', function (data){

        for (var i = 0; i < data.length; i++) {
          dataPoints.push({ label: data[i]['id'], y: data[i]['org_count'] });
        }; // for loop-end
      }); // get-outer getOrgList-inner
    }; // getOrgList-outer

    getOrgList();

  window.onload = function () {

    var chart = new CanvasJS.Chart("chartContainer-for-me", {

      title:{
        text: "All Retailers Organic Count"
      },
      data: [//array of dataSeries
        { //dataSeries object

         /*** Change type "column" to "bar", "area", "line" or "pie"***/
         type: "pie",
         dataPoints : dataPoints
        }
       ]
     });

    chart.render();
  }
