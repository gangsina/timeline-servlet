package com.saguadan.domain;

/**
 * "location": {
 *                 "icon": "http://maps.gstatic.com/intl/en_us/mapfiles/ms/micons/blue-pushpin.png",
 *                 "lat": 39.501711,
 *                 "line": true,
 *                 "lon": -91.94326,
 *                 "name": "Florida, Missouri",
 *                 "zoom": 12
 *             },
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/5/30 14:12.
 */
public class Location extends  _domain{
    String icon;
    String lat;
    String line;
    String lon ;
    String name;
    String zoom;

    public Location() {
    }

    public Location(String icon, String lat, String line, String lon, String name, String zoom) {
        this.icon = icon;
        this.lat = lat;
        this.line = line;
        this.lon = lon;
        this.name = name;
        this.zoom = zoom;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLine() {
        return line;
    }

    public void setLine(String line) {
        this.line = line;
    }

    public String getLon() {
        return lon;
    }

    public void setLon(String lon) {
        this.lon = lon;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getZoom() {
        return zoom;
    }

    public void setZoom(String zoom) {
        this.zoom = zoom;
    }
}
