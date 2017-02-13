var chai = require("chai");
var expect = chai.expect;
var apiroutes = require("../../routes/api_routes.js");
var request = require('supertest');
var SPY = require('../../server.js');

///

describe("Hello", function() {
    it("tests the Testing", function (done) {
        expect("hello").to.eql("hello");
        done();
    });
});

describe("Routes", function () {
    it("retrieve the main page", function (done) {
        var options = {
            method: "GET",
            url: '/'
        };
        // request.get('/').expect(200); // if expect() gets a number, automatically thinks it's a status code
        SPY.inject(options, function (response) {
            console.log("***********************************");
            console.log("inside Hapi inject");
            console.log(process.env.DATABASE_URL);
            console.log(process.env.SPY_KEY);
            // expect(response.statusCode).to.eql(200);
            done();
        });
    });
});