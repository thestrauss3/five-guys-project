var expect = require('chai').expect;

function add(x, y) {
  return x + y;
}

describe ('add', function() {
  it('should add positive numbers', function() {
    expect(add(1,2)).to.equal(3);
  });
});
