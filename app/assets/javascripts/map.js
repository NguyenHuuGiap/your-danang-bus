$(document).ready(function () {
    getCurrentLocation();
    buildMap();
    buildGeoCompletes();

    $("#find").click(function () {
        $("#geocomplete").trigger("geocode");
    });

    $("#examples").find("a").click(function () {
        $("#geocomplete").val($(this).text()).trigger("geocode");
        return false;
    });
});

function getCurrentLocation() {
    navigator.geolocation.getCurrentPosition(function (position) {
        var curLat = position.coords.latitude;
        var curLng = position.coords.longitude;
        var location = {
            user_location: {
                latitude: curLat, longitude: curLng
            }
        };
        buildHiddenInputForLocation("starting_point", curLat, curLng);
        $.post("/user_location", location).done(function (data) {
            $('#geocomplete').val("Your current location")
        });
    });
}

function buildMap() {
    if ($('#map').hasClass('map')) {
        var handler;
        handler = Gmaps.build('Google');
        handler.buildMap({provider: {}, internal: {id: 'map'}}, function () {
            var markers = handler.addMarkers([{
                "lat": 16.0881844, "lng": 108.21656859999999, "picture": {
                    "url": "http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png",
                    "width": 32,
                    "height": 32
                }, "infowindow": "hello!"
            }]);
            handler.bounds.extendWith(markers);
            handler.fitMapToBounds();
        });
    }
}

function buildGeoCompletes() {
    buildGeoComplete("#geocomplete");
    buildGeoComplete("#geocomplete2");
}

function buildGeoComplete(geoId) {
    $(geoId).geocomplete()
        .bind("geocode:result", function (event, result) {
            buildHiddenInputForLocation(geoId === "#geocomplete" ? "starting_point" : "destination",
                result.geometry.location.lat(), result.geometry.location.lng(), result.formatted_address);
        })
        .bind("geocode:error", function (event, status) {
            $.log("ERROR: " + status);
        })
        .bind("geocode:multiple", function (event, results) {
            $.log("Multiple: " + results.length + " results found");
        });
}

function buildHiddenInputForLocation(name, lat, lng, addressName) {
    var value = $.param({"latitude": lat, "longitude": lng, "addressName": addressName});
    $("<input />")
        .attr("type", "hidden")
        .attr("name", name)
        .attr("value", value)
        .appendTo("#geo-form-id");
}

var CustomEase = (function () {
    function CustomEase(_name, segments) {
        this._name = _name;
        this._segments = [];
        for (var i = 0; i < segments.length; i++) {
            this._segments[this._segments.length] =
                new Segment(segments[i].s, segments[i].cp, segments[i].e);
        }
        CustomEase._all[_name] = this;
    }

    CustomEase._all = {};
    CustomEase.create = function create(name, segments) {
        var b = new CustomEase(name, segments);
        return b.ease.bind(b);
    };
    CustomEase.byName = function byName(name) {
        return CustomEase._all[name].ease;
    };
    CustomEase.prototype.ease = function (time, start, change, duration) {
        var factor = time / duration, qty = this._segments.length, i = Math.floor(qty * factor), t, s;
        t = (factor - (i * (1 / qty))) * qty;
        s = this._segments[i];
        return start + change * (s.s + t * (2 * (1 - t) * (s.cp - s.s) + t * (s.e - s.s)));
    };
    CustomEase.prototype.destroy = function () {
        this._segments = null;
        delete CustomEase._all[this._name];
    };
    return CustomEase;
})();
var Segment = (function () {
    function Segment(s, cp, e) {
        this.s = s;
        this.cp = cp;
        this.e = e;
    }

    return Segment;
})();
