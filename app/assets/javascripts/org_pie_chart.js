// <<<<<<< HEAD
// var dataPoints = [{label: "Welcome", y: 100}];

// function getOrgList() {
//   $.get('/admin/org_list', function (data) {

//     for (var i = 0; i < data.length; i++) {
//       dataPoints.push({ label: data[i]['id'], y: data[i]['org_count'] });
//     }; // for loop-end
//   }); // get-outer getOrgList-inner
// }; // getOrgList-outer

// // getOrgList();

// var chart = new CanvasJS.Chart("chartContainer-for-me", {

//   title:{
//     text: "All Retailers Organic Count"
//   },
//   data: [{ type: "pie", dataPoints: dataPoints }] /*** Change type "column" to "bar", "area", "line" or "pie"***/
//  });

// window.onload = function () {
//   dataPoints.shift();

//   getOrgList();

//   chart.render();
// };
// =======

// setTimeout(function(){

// chart = [create chart here]
// chart.render();

// },3000);

var chart = null;

var dataPoints = [];

function getOrgList() {
  $.get('/admin/org_list', function (data) {

    for (var i = 0; i < data.length; i++) {
      $("body")
      .append(dataPoints.push({ label: data[i]['id'], y: data[i]['org_count'] }))
      .append(chart.render());
    };
    // for loop-end
  }); // get-outer getOrgList-inner
}; // getOrgList-outer

getOrgList();

chart = new CanvasJS.Chart("chartContainer-for-me", {

  title:{
    text: "All Retailers Organic Count"
  },
  data: [{ type: "pie", dataPoints: dataPoints }] /*** Change type "column" to "bar", "area", "line" or "pie"***/
});

chart.render();


// >>>>>>> c6464dba1ceb64db3e764efb9c277f9f8027b35a
