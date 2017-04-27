import BurgerIndex from '../src/components/BurgerIndex';

describe('Burger Index', () => {
  let wrapper;

  beforeEach(() => {
    spyOn(global, 'fetch').and.returnValue(
      createResponseFromFixture('burgers/index')
    );
  });

  afterEach(() => {
    wrapper.unmount();
  });

  describe('visiting the burger index', () => {
    beforeEach(() => {
      wrapper = mount(
        <BurgerIndex />
      );
    });

    // it('has links labeled by their summary', done => {
    //   setTimeout(() => {
    //     let pageText = wrapper.text();
    //     expect(pageText).toMatch('facebook');
    //     expect(pageText).toMatch('reddit');
    //     expect(pageText).toMatch('tumblr');
    //     done();
    //   },0)
    // });
  });
});
