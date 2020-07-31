
component {
  
  function default() {
    
    cfhttp(method="GET", charset="utf-8", url='https://applefacilities.review.blueriver.com/index.cfm/_api/json/v1/scv/building/?andOpenGrouping&locationCode%5B0%5D=sqo&or&locationCode%5B2%5D=nwr&or&locationCode%5B4%5D=scv&or&locationCode%5B6%5D=sfo&closeGrouping&fields=buildingname,buildingabbr,lat,lng,black,buildingZone&active=1&cachedwithin=600', result="local.result") {
			cfhttpparam(type="header", name="Content-type" value="application/json");
    }
    
    rc.buildings = [];
    rc.unzoned_zone_name = 'Other';

    if(isJSON(local.result.filecontent)) {
      rc.buildings = deserializeJSON(local.result.filecontent).data.items;
      rc.buildings.sort(
        function(a,b) {          
          if(!len(a.buildingzone)) {
            return CompareNoCase( 'zzzzz' & a.buildingname, b.buildingzone & b.buildingname )
          } else if (!len(b.buildingzone)) {
            return CompareNoCase( a.buildingzone & a.buildingname,  'zzzzz' & b.buildingname )
          } else {
            return CompareNoCase( a.buildingzone & a.buildingname, b.buildingzone & b.buildingname )
          }
          
        }
      );
      rc.zoneBuldingCount = zoneBuildingCounts(rc.buildings, rc.unzoned_zone_name);
    }


  }

  function zoneBuildingCounts(buildings, unzoned_name) {
    var buildingCount = {};
    for(var building in arguments.buildings) {
      building.buildingzone = len(building.buildingzone) ? building.buildingzone : arguments.unzoned_name;
      if(!structKeyExists(buildingCount, building.buildingzone)) {
        buildingCount[building.buildingzone]=1;
      } else {
        buildingCount[building.buildingzone]++;
      }
    }

    return buildingCount;
  }
  
}