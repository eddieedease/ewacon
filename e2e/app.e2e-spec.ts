import { EwaconPage } from './app.po';

describe('ewacon App', () => {
  let page: EwaconPage;

  beforeEach(() => {
    page = new EwaconPage();
  });

  it('should display welcome message', done => {
    page.navigateTo();
    page.getParagraphText()
      .then(msg => expect(msg).toEqual('Welcome to app!!'))
      .then(done, done.fail);
  });
});
