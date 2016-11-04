Table allRidesTable;

int stationRideCounts[]; 
String stations[] = {
  "10th St & Penn Ave", //10th St & Penn Ave (David L. Lawrence Convention Center)
  "12th St & Penn Ave", 
  "17th St & Penn Ave", 
  "21st St & Penn Ave", 
  "37th St & Butler St", 
  "42nd St & Butler St", 
  "42nd & Penn Ave.", 
  "Alder St & S Highland Ave", 
  "Atwood St & Bates", 
  "Bigelow Blvd & Fifth Ave", 
  "Boulevard of the Allies & Parkview Ave", 
  "Centre Ave & Kirkpatrick St", 
  "Centre Ave & PPG Paints Arena", 
  "Coltart Ave & Forbes Ave", 
  "Ellsworth Ave & N Neville St", 
  "Federal St & E North Ave", 
  "Fifth Ave & S Bouquet", 
  "Fifth Ave & S Dithridge St", 
  "First Ave & B St", 
  "First Ave & Smithfield St", 
  "Forbes Ave & Grant St", 
  "Forbes Ave & Market Sq", 
  "Fort Duquesne Blvd & 7th", 
  "Frew St & Schenley Dr", 
  "Isabella St & Federal St", 
  "Ivy St & Walnut St", 
  "Liberty Ave & Stanwix St", 
  "Liberty Ave & Baum Blvd", 
  "Liberty Ave & S Millvale", 
  "Maryland Ave & Ellsworth Ave", 
  "North Shore Trail & Fort Duquesne Bridge", 
  "Penn Ave & N Fairmount St", 
  "Penn Ave & Putnam St (Bakery Square)", 
  "Ridge Ave & Brighton Rd (CCAC)", 
  "Ross St & Sixth Ave", 
  "S 12th St & E Carson St", 
  "S 18th St & Sidney St", 
  "S 22nd St & E Carson St", 
  "S 25th St & E Carson St", 
  "S 27th St & Sidney St. (Southside Works)", 
  "S Euclid Ave & Centre Ave", 
  "S Negley Ave & Baum Blvd", 
  "Schenley Dr at Schenley Plaza", 
  "Shady Ave & Ellsworth Ave", 
  "Stevenson St & Forbes Ave", 
  "Taylor St & Liberty Ave", 
  "Third Ave & Wood St", 
  "Zulema St & Coltart Ave"
};


void setup() {

  int nStations = stations.length;
  stationRideCounts = new int[nStations]; 
  for (int s=0; s<nStations; s++) {
    stationRideCounts[s] = 0; // initialized to zero yo
  }


  allRidesTable = loadTable("HealthyRideRentals2015Q3.csv", "header"); 
  // Trip id,Starttime,Stoptime,Bikeid,Tripduration,From station id,From station name,To station id,To station name,Usertype

  int nRows = allRidesTable.getRowCount(); 
  for (int i=0; i<nRows; i++) {
    TableRow ithRow = allRidesTable.getRow(i); 
    String ithFromStationName = ithRow.getString("From station name");
    String ithToStationName = ithRow.getString("To station name"); 

    for (int s=0; s<nStations; s++) {
      if (ithFromStationName.contains(stations[s])){
        stationRideCounts[s] = stationRideCounts[s] + 1;
      }
      if (ithToStationName.contains(stations[s])){
        stationRideCounts[s]++;
      }
    }
  }

  println("Station" + "\t" + "nRides"); 
  for (int s=0; s<nStations; s++) {
    println (stations[s] + "\t" + stationRideCounts[s]);
  }
}






//    int id = ithRow.getInt("id");