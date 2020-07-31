<cfset var current_zone = "">
<cfoutput>
  <div class="container-fluid">
    <h2 style="border-bottom: 1px solid grey">Index</h2>
    
      <cfloop index="i" from=1 to="#arrayLen(rc.buildings)#">
        <cfif current_zone != rc.buildings[i].buildingzone>
          <cfset var zone_count = 0>
          <cfset var column_count = 1>
          <cfset var buildings_in_zone = rc.zoneBuldingCount[rc.buildings[i].buildingzone]>
          <cfset var buildings_in_column = ceiling(rc.zoneBuldingCount[rc.buildings[i].buildingzone]/6)>
          <cfset current_zone = rc.buildings[i].buildingzone>
          <h4>#rc.buildings[i].buildingzone#</h4>
          <div class="row">
            <div class="col-sm">
        </cfif>

          <cfif rc.buildings[i].black == 0 && len(rc.buildings[i].buildingname)>
            <a href="https://applefacilities.review.blueriver.com">#rc.buildings[i].buildingname#</a>
          <cfelseif len(rc.buildings[i].buildingname)>
            #rc.buildings[i].buildingname#
          </cfif>
          <br>
          <cfset zone_count++>
          
          <cfif zone_count == buildings_in_zone>  
            </div><!--- close column --->
            <cfloop index="j" from="1" to="#6-column_count#">
              <div class="col-sm"></div>
            </cfloop>
            
          <cfelseif zone_count mod buildings_in_column == 0>
            </div> <!--- close column --->
            <cfset column_count++>
            <div class="col-sm">
          </cfif>

          <cfif i == arrayLen(rc.buildings) || current_zone != rc.buildings[i+1].buildingzone>
            </div>
          </cfif>
      </cfloop>
    
  </div>
</cfoutput>
