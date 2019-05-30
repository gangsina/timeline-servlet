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
    double lat=0;
    boolean line;
    double lon =0;
    String name;
    int zoom=8;

    public Location() {
    }

    public Location(String icon, double lat, boolean line, double lon, String name, int zoom) {
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

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public boolean isLine() {
        return line;
    }

    public void setLine(boolean line) {
        this.line = line;
    }

    public double getLon() {
        return lon;
    }

    public void setLon(double lon) {
        this.lon = lon;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getZoom() {
        return zoom;
    }

    public void setZoom(int zoom) {
        this.zoom = zoom;
    }
}
