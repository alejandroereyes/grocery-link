
$( document ).ready(function(){
  if($('#chartContainer-for-me').length) {
    var chart = null;

    var dataPoints = [];

    function getOrgList() {
      $.get('/admin/org_list', function (data) {

        for (var i = 0; i < data.length; i++) {
          dataPoints.push({ label: data[i]['id'], y: data[i]['org_count'] })
        } // for loop-end
        chart.render();
      }); // get-outer getOrgList-inner
    }; // getOrgList-outer

    getOrgList();


    chart = new CanvasJS.Chart("chartContainer-for-me", {

      title:{
        text: "All Retailers Organic Count"
      },
      data: [{ type: "pie", dataPoints: dataPoints }] /*** Change type "column" to "bar", "area", "line" or "pie"***/
    });
  }
});

