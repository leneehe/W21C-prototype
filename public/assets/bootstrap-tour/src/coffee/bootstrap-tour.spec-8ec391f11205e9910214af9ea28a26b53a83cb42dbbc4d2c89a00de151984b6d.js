(function() {
  describe('Bootstrap Tour', function() {
    beforeEach(function() {
      $.support.transition = false;
      return $.fx.off = true;
    });
    afterEach(function() {
      var tour;
      tour = this.tour;
      this.tour._setState('current_step', null);
      this.tour._setState('end', null);
      return $.each(this.tour._options.steps, function(i, s) {
        var $element;
        $element = $(tour.getStep(i).element);
        $element.popover('dispose').removeData('bs.popover');
        return $element.remove();
      });
    });
    it('should set the tour options', function() {
      this.tour = new Tour({
        name: 'test',
        afterSetState: function() {
          return true;
        },
        afterGetState: function() {
          return true;
        }
      });
      expect(this.tour._options.name).toBe('test');
      expect(this.tour._options.afterGetState).toBeTruthy;
      return expect(this.tour._options.afterSetState).toBeTruthy;
    });
    it('should have `tour` as default name', function() {
      this.tour = new Tour;
      return expect(this.tour._options.name).toBe('tour');
    });
    it('should accept an array of steps', function() {
      this.tour = new Tour;
      return expect(this.tour._options.steps).toEqual([]);
    });
    it('`_setState` should save state as localStorage item', function() {
      this.tour = new Tour;
      this.tour._setState('test', 'yes');
      return expect(window.localStorage.getItem('tour_test')).toBe('yes');
    });
    it('`_setState` should execute storage.setItem function if provided', function() {
      var aliasKeyName, aliasValue;
      aliasKeyName = void 0;
      aliasValue = void 0;
      this.tour = new Tour({
        name: 'test',
        storage: {
          setItem: function(keyName, value) {
            aliasKeyName = keyName;
            return aliasValue = value;
          },
          getItem: function(value) {
            return aliasValue;
          }
        }
      });
      this.tour._setState('save', 'yes');
      expect(aliasKeyName).toBe('test_save');
      return expect(aliasValue).toBe('yes');
    });
    it('`_setState` should save state internally if storage is false', function() {
      this.tour = new Tour({
        storage: false
      });
      this.tour._setState('test', 'yes');
      return expect(this.tour._state['test']).toBe('yes');
    });
    it('`_removeState` should remove state localStorage item', function() {
      this.tour = new Tour;
      this.tour._setState('test', 'yes');
      this.tour._removeState('test');
      return expect(window.localStorage.getItem('tour_test')).toBe(null);
    });
    it('`_removeState` should remove state internally if storage is false', function() {
      this.tour = new Tour({
        storage: false
      });
      this.tour._setState('test', 'yes');
      this.tour._removeState('test');
      return expect(this.tour._state['test']).toBeUndefined();
    });
    it('`_getState` should get state localStorage items', function() {
      this.tour = new Tour;
      this.tour._setState('test', 'yes');
      expect(this.tour._getState('test')).toBe('yes');
      return window.localStorage.setItem('tour_test', null);
    });
    it('`_getState` should get the internal state if storage is false', function() {
      this.tour = new Tour({
        storage: false
      });
      this.tour._setState('test', 'yes');
      return expect(this.tour._getState('test')).toBe('yes');
    });
    it('`addStep` should add a step', function() {
      var step;
      this.tour = new Tour;
      step = {
        element: '#element-1'
      };
      this.tour.addStep(step);
      return expect(this.tour._options.steps).toEqual([step]);
    });
    it('`addSteps` should add multiple step', function() {
      var firstStep, secondStep;
      this.tour = new Tour;
      firstStep = {
        element: '#element-1'
      };
      secondStep = {
        element: '#element-2'
      };
      this.tour.addSteps([firstStep, secondStep]);
      return expect(this.tour._options.steps).toEqual([firstStep, secondStep]);
    });
    it('step should have an id', function() {
      var $element1;
      this.tour = new Tour;
      $element1 = $('<div id="element-1"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.start();
      return expect($($element1.data('bs.popover').getTipElement()).attr('id')).toBe('step-0');
    });
    it('with `onStart` option should run the callback before showing the first step', function() {
      var tour_test;
      tour_test = 0;
      $('<div id="element-1"></div>').appendTo('body');
      this.tour = new Tour({
        onStart: function() {
          return tour_test += 2;
        }
      });
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.start();
      return expect(tour_test).toBe(2);
    });
    it('with `onEnd` option should run the callback after hiding the last step', function() {
      var tour_test;
      tour_test = 0;
      $('<div id="element-1"></div>').appendTo('body');
      this.tour = new Tour({
        onEnd: function() {
          return tour_test += 2;
        }
      });
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.start();
      this.tour.end();
      return expect(tour_test).toBe(2);
    });
    it('with `onShow` option should run the callback before showing the step', function() {
      var tour_test;
      tour_test = 0;
      $('<div id="element-1"></div>').appendTo('body');
      $('<div id="element-2"></div>').appendTo('body');
      this.tour = new Tour({
        onShow: function() {
          return tour_test += 2;
        }
      });
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2'
      });
      this.tour.start();
      expect(tour_test).toBe(2);
      this.tour.next();
      return expect(tour_test).toBe(4);
    });
    it('with `onShown` option should run the callback after showing the step', function() {
      var tour_test;
      tour_test = 0;
      $('<div id="element-1"></div>').appendTo('body');
      $('<div id="element-2"></div>').appendTo('body');
      this.tour = new Tour({
        onShown: function() {
          return tour_test += 2;
        }
      });
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2'
      });
      this.tour.start();
      return expect(tour_test).toBe(2);
    });
    it('with `onHide` option should run the callback before hiding the step', function() {
      var tour_test;
      tour_test = 0;
      $('<div id="element-1"></div>').appendTo('body');
      $('<div id="element-2"></div>').appendTo('body');
      this.tour = new Tour({
        onHide: function() {
          return tour_test += 2;
        }
      });
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2'
      });
      this.tour.start();
      this.tour.next();
      expect(tour_test).toBe(2);
      this.tour.hideStep(1);
      return expect(tour_test).toBe(4);
    });
    it('with onHidden option should run the callback after hiding the step', function() {
      var tour_test;
      tour_test = 0;
      $('<div id="element-1"></div>').appendTo('body');
      $('<div id="element-2"></div>').appendTo('body');
      this.tour = new Tour({
        onHidden: function() {
          return tour_test += 2;
        }
      });
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2'
      });
      this.tour.start();
      this.tour.next();
      expect(tour_test).toBe(2);
      this.tour.next();
      return expect(tour_test).toBe(4);
    });
    it('`addStep` with onShow option should run the callback before showing the step', function() {
      var tour_test;
      tour_test = 0;
      this.tour = new Tour;
      $('<div id="element-1"></div>').appendTo('body');
      $('<div id="element-2"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2',
        onShow: function() {
          return tour_test = 2;
        }
      });
      this.tour.start();
      expect(tour_test).toBe(0);
      this.tour.next();
      return expect(tour_test).toBe(2);
    });
    it('`addStep` with onHide option should run the callback before hiding the step', function() {
      var tour_test;
      tour_test = 0;
      this.tour = new Tour;
      $('<div id="element-1"></div>').appendTo('body');
      $('<div id="element-2"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2',
        onHide: function() {
          return tour_test = 2;
        }
      });
      this.tour.start();
      this.tour.next();
      expect(tour_test).toBe(0);
      this.tour.hideStep(1);
      return expect(tour_test).toBe(2);
    });
    it('`getStep` should get a step', function() {
      var step;
      this.tour = new Tour;
      $('<div id="element-1"></div>').appendTo('body');
      step = {
        element: '#element-1',
        id: 'step-0',
        path: 'test',
        host: '',
        placement: 'left',
        title: 'Test',
        content: 'Just a test',
        next: 2,
        prev: -1,
        animation: false,
        autoscroll: true,
        container: 'body',
        backdrop: false,
        backdropPadding: 0,
        backdropContainer: 'body',
        backdropElement: $('<div></div>').appendTo('body'),
        redirect: true,
        reflexElement: $('<div></div>').appendTo('body'),
        orphan: false,
        duration: false,
        delay: false,
        template: '<div class="popover"> <div class="arrow"></div> <h3 class="popover-header"></h3> <div class="popover-body"></div> <nav class="popover-navigation"> <div class="btn-group"> <button class="btn btn-sm btn-secondary" data-role="prev">&laquo; Prev</button> <button class="btn btn-sm btn-secondary" data-role="next">Next &raquo;</button> </div> <button class="btn btn-sm btn-secondary" data-role="end">End tour</button> </nav> </div>',
        onShow: function(tour) {},
        onShown: function(tour) {},
        onHide: function(tour) {},
        onHidden: function(tour) {},
        onNext: function(tour) {},
        onPrev: function(tour) {},
        onPause: function(tour) {},
        onResume: function(tour) {},
        onRedirectError: function(tour) {}
      };
      this.tour.addStep(step);
      return expect(this.tour.getStep(0)).toEqual(step);
    });
    it('`start` should start a tour', function() {
      this.tour = new Tour;
      $('<div id="element-1"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.start();
      return expect($('.popover').length).toBe(1);
    });
    it('`init` should continue a tour', function() {
      this.tour = new Tour;
      $('<div id="element-1"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour._setState('current_step', 0);
      this.tour.init();
      return expect($('.popover').length).toBe(1);
    });
    it('`init` should not continue a tour that ended', function() {
      this.tour = new Tour;
      $('<div id="element-1"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour._setState('current_step', 0);
      this.tour._setState('end', 'yes');
      this.tour.init();
      return expect($('.popover').length).toBe(0);
    });
    it('`init`(true) should force continuing a tour that ended', function() {
      this.tour = new Tour;
      $('<div id="element-1"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour._setState('current_step', 0);
      this.tour._setState('end', 'yes');
      this.tour.init(true);
      return expect($('.popover').length).toBe(1);
    });
    it('`next` should hide current step and show next step', function() {
      var $element1, $element2;
      $element1 = $('<div id="element-1"></div>').appendTo('body');
      $element2 = $('<div id="element-2"></div>').appendTo('body');
      this.tour = new Tour;
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2'
      });
      this.tour.start();
      this.tour.next();
      expect($element1.data('bs.popover')).toBeUndefined();
      return expect($($element2.data('bs.popover').getTipElement()).filter(':visible').length).toBe(1);
    });
    it('`end` should hide current step and set end state', function() {
      var $element1;
      $element1 = $('<div id="element-1"></div>').appendTo('body');
      this.tour = new Tour;
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.start();
      this.tour.end();
      expect($element1.data('bs.popover')).toBeUndefined();
      return expect(this.tour._getState('end')).toBe('yes');
    });
    it('`ended` should return true if tour ended and false if not', function() {
      $('<div id="element-1"></div>').appendTo('body');
      this.tour = new Tour;
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.start();
      expect(this.tour.ended()).toBe(false);
      this.tour.end();
      return expect(this.tour.ended()).toBe(true);
    });
    it('`ended` should always return false if tour started by force', function() {
      $('<div id="element-1"></div>').appendTo('body');
      this.tour = new Tour;
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.end();
      this.tour.start(true);
      return expect(this.tour.ended()).toBe(false);
    });
    it('`restart` should clear all states and start tour', function() {
      $('<div id="element-1"></div>').appendTo('body');
      $('<div id="element-2"></div>').appendTo('body');
      this.tour = new Tour;
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2'
      });
      this.tour.start();
      this.tour.next();
      this.tour.end();
      this.tour.restart();
      expect(this.tour._getState('end')).toBe(null);
      expect(this.tour._current).toBe(0);
      return expect($('.popover').length).toBe(1);
    });
    it('`hideStep` should hide a step', function() {
      var $element1;
      $element1 = $('<div id="element-1"></div>').appendTo('body');
      this.tour = new Tour;
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.start();
      this.tour.hideStep(0);
      return expect($element1.data('bs.popover')).toBeUndefined();
    });
    it('`showStep` should set a step and show it', function() {
      var $element2;
      $('<div id="element-1"></div>').appendTo('body');
      $element2 = $('<div id="element-2"></div>').appendTo('body');
      this.tour = new Tour;
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2'
      });
      this.tour.showStep(1);
      expect(this.tour._current).toBe(1);
      expect($('.popover').length).toBe(1);
      return expect($($element2.data('bs.popover').getTipElement()).filter(':visible').length).toBe(1);
    });
    it('`showStep` should not show anything when the step does not exist', function() {
      $('<div id="element-1"></div>').appendTo('body');
      $('<div id="element-2"></div>').appendTo('body');
      this.tour = new Tour;
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2'
      });
      this.tour.showStep(2);
      return expect($('.popover').length).toBe(0);
    });
    it('`showStep` should execute template if it is a function', function() {
      $('<div id="element-1"></div>').appendTo('body');
      this.tour = new Tour;
      this.tour.addStep({
        element: '#element-1',
        template: function() {
          return '<div class="popover"></div>';
        }
      });
      this.tour.showStep(0);
      return expect($('.popover').length).toBe(1);
    });
    it('`getStep` should add disabled classes to the first and last popover buttons', function() {
      $('<div id="element-1"></div>').appendTo('body');
      $('<div id="element-2"></div>').appendTo('body');
      this.tour = new Tour;
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2'
      });
      this.tour.showStep(0);
      expect($('.popover [data-role="prev"]').hasClass('disabled')).toBe(true);
      this.tour.showStep(1);
      return expect($('.popover [data-role="next"]').hasClass('disabled')).toBe(true);
    });
    it('`setCurrentStep` should set the current step', function() {
      this.tour = new Tour;
      this.tour.setCurrentStep(4);
      expect(this.tour._current).toBe(4);
      this.tour._setState('current_step', 2);
      this.tour.setCurrentStep();
      return expect(this.tour._current).toBe(2);
    });
    it('`goTo` should show the specified step', function() {
      var $element2;
      this.tour = new Tour;
      $('<div id="element-1"></div>').appendTo('body');
      $element2 = $('<div id="element-2"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2'
      });
      this.tour.goTo(1);
      return expect($($element2.data('bs.popover').getTipElement()).filter(':visible').length).toBe(1);
    });
    it('`next` should show the next step', function() {
      var $element2;
      this.tour = new Tour;
      $('<div id="element-1"></div>').appendTo('body');
      $element2 = $('<div id="element-2"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2'
      });
      this.tour.start();
      this.tour.next();
      return expect($($element2.data('bs.popover').getTipElement()).filter(':visible').length).toBe(1);
    });
    it('`prev` should show the previous step', function() {
      var $element1;
      this.tour = new Tour;
      $element1 = $('<div id="element-1"></div>').appendTo('body');
      $('<div id="element-2"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2'
      });
      this.tour.goTo(1);
      this.tour.prev();
      return expect($($element1.data('bs.popover').getTipElement()).filter(':visible').length).toBe(1);
    });
    it('`showStep` should show multiple step on the same element', function() {
      var $element1, $element2;
      this.tour = new Tour;
      $element1 = $('<div id="element-1"></div>').appendTo('body');
      $element2 = $('<div id="element-2"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2'
      });
      this.tour.start();
      expect($($element1.data('bs.popover').getTipElement()).filter(':visible').length).toBe(1);
      this.tour.next();
      return expect($($element2.data('bs.popover').getTipElement()).filter(':visible').length).toBe(1);
    });
    it('should get url properties correctly', function() {
      this.tour = new Tour;
      expect(this.tour._getProtocol('http://example.com')).toBe('http');
      expect(this.tour._getProtocol('https://example.com')).toBe('https');
      expect(this.tour._getProtocol('www.example.com')).toBe('http');
      expect(this.tour._getProtocol('example.com')).toBe('http');
      expect(this.tour._getHost('http://example.com')).toBe('example.com');
      expect(this.tour._getHost('www.example.com')).toBe('www.example.com');
      expect(this.tour._getHost('example.com/path')).toBe('example.com');
      expect(this.tour._getPath('/somepath?foo=bar')).toBe('/somepath');
      expect(this.tour._getPath('/somepath#foo=bar')).toBe('/somepath');
      expect(this.tour._getPath('/somepath?foo=bar#hash')).toBe('/somepath');
      expect(this.tour._getQuery('/somepath?one=bar')).toEqual({
        one: 'bar'
      });
      expect(this.tour._getQuery('/somepath?one=bar&two=foo')).toEqual({
        one: 'bar',
        two: 'foo'
      });
      expect(this.tour._getHash('/somepath#one=bar&two=foo')).toEqual({
        one: 'bar',
        two: 'foo'
      });
      return expect(this.tour._getHash('/somepath#one=bar&two=foo')).toEqual({
        one: 'bar',
        two: 'foo'
      });
    });
    it('should evaluate `path` correctly', function() {
      this.tour = new Tour;
      expect(this.tour._isRedirect('', '/anotherpath', {
        origin: '',
        href: '',
        pathname: '/somepath',
        search: '',
        hash: ''
      })).toBe(true);
      expect(this.tour._isRedirect('', void 0, {
        origin: '',
        href: '',
        pathname: '/',
        search: '',
        hash: ''
      })).toBe(false);
      expect(this.tour._isRedirect('', '', {
        origin: '',
        href: '',
        pathname: '/',
        search: '',
        hash: ''
      })).toBe(false);
      expect(this.tour._isRedirect('', '/somepath', {
        origin: '',
        href: '',
        pathname: '/somepath',
        search: '',
        hash: ''
      })).toBe(false);
      expect(this.tour._isRedirect('', '/somepath/', {
        origin: '',
        href: '',
        pathname: '/somepath',
        search: '',
        hash: ''
      })).toBe(false);
      expect(this.tour._isRedirect('', '/somepath', {
        origin: '',
        href: '',
        pathname: '/somepath/',
        search: '',
        hash: ''
      })).toBe(false);
      expect(this.tour._isRedirect('', '/somepath?search=true', {
        origin: '',
        href: '',
        pathname: '/somepath',
        search: '',
        hash: ''
      })).toBe(true);
      expect(this.tour._isRedirect('', '/somepath/?search=true', {
        origin: '',
        href: '',
        pathname: '/somepath',
        search: '',
        hash: ''
      })).toBe(true);
      expect(this.tour._isRedirect('', '/somepath?search=true&foo=bar', {
        origin: '',
        href: '',
        pathname: '/somepath',
        search: '',
        hash: ''
      })).toBe(true);
      expect(this.tour._isRedirect('', '/somepath?search=true&foo=bar', {
        origin: '',
        href: '',
        pathname: '/somepath',
        search: '?search=true',
        hash: ''
      })).toBe(true);
      expect(this.tour._isRedirect('', '/somepath?search=true&foo=bar', {
        origin: '',
        href: '',
        pathname: '/somepath',
        search: '?foo=bar',
        hash: ''
      })).toBe(true);
      expect(this.tour._isRedirect('', '/somepath?search=true&foo=bar', {
        origin: '',
        href: '',
        pathname: '/somepath',
        search: '?foo=bar&search=true',
        hash: ''
      })).toBe(false);
      expect(this.tour._isRedirect('', '/somepath?search=true&foo=bar', {
        origin: '',
        href: '',
        pathname: '/somepath',
        search: '?search=true&foo=bar',
        hash: ''
      })).toBe(false);
      expect(this.tour._isRedirect('', '/somepath#search=true', {
        origin: '',
        href: '',
        pathname: '/somepath',
        search: '',
        hash: ''
      })).toBe(true);
      expect(this.tour._isRedirect('', '/somepath/#search=true', {
        origin: '',
        href: '',
        pathname: '/somepath',
        search: '',
        hash: ''
      })).toBe(true);
      expect(this.tour._isRedirect('', '/somepath#search=true&foo=bar', {
        origin: '',
        href: '',
        pathname: '/somepath',
        search: '',
        hash: ''
      })).toBe(true);
      expect(this.tour._isRedirect('', '/somepath#search=true&foo=bar', {
        origin: '',
        href: '',
        pathname: '/somepath',
        search: '',
        hash: '#search=true'
      })).toBe(true);
      expect(this.tour._isRedirect('', '/somepath#search=true&foo=bar', {
        origin: '',
        href: '',
        pathname: '/somepath',
        search: '',
        hash: '#foo=bar'
      })).toBe(true);
      expect(this.tour._isRedirect('', '/somepath#search=true&foo=bar', {
        origin: '',
        href: '',
        pathname: '/somepath',
        search: '',
        hash: '#foo=bar&search=true'
      })).toBe(false);
      expect(this.tour._isRedirect('', '/somepath#search=true&foo=bar', {
        origin: '',
        href: '',
        pathname: '/somepath',
        search: '',
        hash: '#search=true&foo=bar'
      })).toBe(false);
      return expect(this.tour._isRedirect('', /some.*/, {
        origin: '',
        href: '',
        pathname: '/somepath',
        search: '',
        hash: ''
      })).toBe(false);
    });
    it('`_getState` should return null after `_removeState` with null value', function() {
      this.tour = new Tour;
      this.tour._setState('test', 'test');
      this.tour._removeState('test');
      return expect(this.tour._getState('test')).toBe(null);
    });
    it('`_removeState` should call `afterRemoveState` callback', function() {
      var sentinel;
      sentinel = false;
      this.tour = new Tour({
        afterRemoveState: function() {
          return sentinel = true;
        }
      });
      this.tour._removeState('current_step');
      return expect(sentinel).toBe(true);
    });
    it('should not move to the next state until the onShow promise is resolved', function() {
      var $element1, $element2, deferred;
      this.tour = new Tour;
      deferred = $.Deferred();
      $element1 = $('<div id="element-1"></div>').appendTo('body');
      $element2 = $('<div id="element-2"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2',
        onShow: function() {
          return deferred;
        }
      });
      this.tour.start();
      this.tour.next();
      expect($element1.data('bs.popover')).toBeUndefined;
      deferred.resolve();
      return expect($($element2.data('bs.popover').getTipElement()).filter(':visible').length).toBe(1);
    });
    it('should not hide popover until the onHide promise is resolved', function() {
      var deferred;
      deferred = $.Deferred();
      this.tour = new Tour;
      $('<div id="element-1"></div>').appendTo('body');
      $('<div id="element-2"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1',
        onHide: function() {
          return deferred;
        }
      });
      this.tour.addStep({
        element: '#element-2'
      });
      this.tour.start();
      this.tour.next();
      expect(this.tour._current).toBe(0);
      deferred.resolve();
      return expect(this.tour._current).toBe(1);
    });
    it('should not start until the onStart promise is resolved', function() {
      var deferred;
      deferred = $.Deferred();
      this.tour = new Tour({
        onStart: function() {
          return deferred;
        }
      });
      $('<div id="element-1"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.start();
      expect($('.popover').length).toBe(0);
      deferred.resolve();
      return expect($('.popover').length).toBe(1);
    });
    it('should add `tour-step-element-reflex` class to the step element if reflex is active', function() {
      var $element;
      this.tour = new Tour;
      $element = $('<div id="element-1"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1',
        reflex: true
      });
      this.tour.addStep({
        element: '#element-2'
      });
      expect($element.hasClass('tour-step-element-reflex')).toBe(false);
      this.tour.start();
      expect($element.hasClass('tour-step-element-reflex')).toBe(true);
      this.tour.next();
      return expect($element.hasClass('tour-step-element-reflex')).toBe(false);
    });
    it('should add `tour-step-element-reflex` class to reflexElement if reflex is defined', function() {
      var $definedElement, $element;
      this.tour = new Tour;
      $element = $('<div id="element-1"></div>').appendTo('body');
      $definedElement = $('<div id="ref"></div>').appendTo('body');
      $('<div id="element-2"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1',
        reflex: true,
        reflexElement: '#ref'
      });
      this.tour.addStep({
        element: '#element-2'
      });
      expect($element.hasClass('tour-step-element-reflex')).toBe(false);
      expect($definedElement.hasClass('tour-step-element-reflex')).toBe(false);
      this.tour.start();
      expect($element.hasClass('tour-step-element-reflex')).toBe(false);
      expect($definedElement.hasClass('tour-step-element-reflex')).toBe(true);
      this.tour.next();
      expect($element.hasClass('tour-step-element-reflex')).toBe(false);
      return expect($definedElement.hasClass('tour-step-element-reflex')).toBe(false);
    });
    it('should add `tour-{tourName}-reflex` class to the step popover if reflex is active', function() {
      var $element;
      this.tour = new Tour;
      $element = $('<div id="element-1"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1',
        reflex: true
      });
      this.tour.addStep({
        element: '#element-2'
      });
      expect($('.popover').hasClass("tour-" + this.tour._options.name + "-reflex")).toBe(false);
      this.tour.start();
      expect($('.popover').hasClass("tour-" + this.tour._options.name + "-reflex")).toBe(true);
      this.tour.next();
      return expect($('.popover').hasClass("tour-" + this.tour._options.name + "-reflex")).toBe(false);
    });
    it('`showStep` redirects to the anchor when the path is an anchor', function() {
      this.tour = new Tour;
      $('<div id="element-1"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1',
        path: '#mytest'
      });
      this.tour.showStep(0);
      expect(document.location.hash).toBe('#mytest');
      return document.location.hash = '';
    });
    it('`showStep` show the step when the path is an anchor', function() {
      var $element1, current_path;
      current_path = location.pathname;
      this.tour = new Tour;
      $element1 = $('<div id="element-1"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1',
        path: current_path + "#mytest"
      });
      this.tour.showStep(0);
      expect($($element1.data('bs.popover').getTipElement()).filter(':visible').length).toBe(1);
      return document.location.hash = '';
    });
    it('`backdrop` parameter should show backdrop with step', function() {
      this.tour = new Tour;
      $('<div id="element-1"></div>').appendTo('body');
      $('<div id="element-2"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1',
        backdrop: false
      });
      this.tour.addStep({
        element: '#element-2',
        backdrop: true
      });
      this.tour.start();
      expect($('.tour-backdrop').length).toBe(0);
      expect($('.tour-step-backdrop').length).toBe(0);
      this.tour.next();
      expect($('.tour-backdrop').length).toBe(4);
      expect($('.tour-step-backdrop').length).toBe(1);
      this.tour.end();
      expect($('.tour-backdrop').length).toBe(0);
      return expect($('.tour-step-backdrop').length).toBe(0);
    });
    it('step with backdrop and invalid selector should not attempt to create an overlay element', function() {
      this.tour = new Tour;
      this.tour._showOverlayElement({
        backdropElement: '#nonExistingElement'
      });
      return expect($('.tour-backdrop').length).toBe(0);
    });
    it('should render the padding on the backdrop element', function() {
      var $firstElement, $secondElement, firstPadding, secondPadding;
      this.tour = new Tour({
        backdrop: true
      });
      $firstElement = $('<div id="element-1"></div>', {
        width: 10,
        height: 10
      }).appendTo('body');
      $secondElement = $('<div id="element-2"></div>').css({
        position: 'absolute',
        top: 100,
        left: 300,
        width: 10,
        height: 10
      }).appendTo('body');
      firstPadding = 20;
      secondPadding = {
        top: 40,
        right: 30,
        bottom: 20,
        left: 10
      };
      this.tour.addStep({
        backdrop: true,
        backdropPadding: firstPadding,
        element: '#element-1'
      });
      this.tour.addStep({
        backdrop: true,
        backdropPadding: secondPadding,
        element: '#element-2'
      });
      this.tour.start();
      expect(this.tour.backdrops.top.offset().top + this.tour.backdrops.top.height()).toBe(0);
      expect(this.tour.backdrops.left.offset().top).toBe($firstElement.offset().top - firstPadding);
      expect(this.tour.backdrops.left.offset().top + this.tour.backdrops.left.height()).toBe($firstElement.offset().top + $firstElement.height() + firstPadding);
      expect(this.tour.backdrops.left.offset().left + this.tour.backdrops.left.width()).toBe(0);
      expect(this.tour.backdrops.bottom.offset().top).toBe($firstElement.offset().top + $firstElement.height() + firstPadding);
      expect(this.tour.backdrops.right.offset().top).toBe($firstElement.offset().top - firstPadding);
      expect(this.tour.backdrops.right.offset().top + this.tour.backdrops.right.height()).toBe($firstElement.offset().top + $firstElement.height() + firstPadding);
      expect(this.tour.backdrops.right.offset().left).toBe($firstElement.offset().left + $firstElement.width() + firstPadding);
      this.tour.next();
      expect(this.tour.backdrops.top.offset().top + this.tour.backdrops.top.height()).toBe($secondElement.offset().top - secondPadding.top);
      expect(this.tour.backdrops.left.offset().top).toBe($secondElement.offset().top - secondPadding.top);
      expect(this.tour.backdrops.left.offset().top + this.tour.backdrops.left.height()).toBe($secondElement.offset().top + $secondElement.height() + secondPadding.bottom);
      expect(this.tour.backdrops.left.offset().left + this.tour.backdrops.left.width()).toBe($secondElement.offset().left - secondPadding.left);
      expect(this.tour.backdrops.bottom.offset().top).toBe($secondElement.offset().top + $secondElement.height() + secondPadding.bottom);
      expect(this.tour.backdrops.right.offset().top).toBe($secondElement.offset().top - secondPadding.top);
      expect(this.tour.backdrops.right.offset().top + this.tour.backdrops.right.height()).toBe($secondElement.offset().top + $secondElement.height() + secondPadding.bottom);
      return expect(this.tour.backdrops.right.offset().left).toBe($secondElement.offset().left + $secondElement.width() + secondPadding.right);
    });
    it('`basePath` should prepend the path to the steps', function() {
      this.tour = new Tour({
        basePath: 'test/'
      });
      $('<div id="element-1"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1',
        path: 'test.html'
      });
      return expect(this.tour._isRedirect(this.tour.getStep(0).host, this.tour._options.basePath + this.tour.getStep(0).path, {
        href: '',
        pathname: 'test/test.html',
        search: '',
        hash: ''
      })).toBe(false);
    });
    it('should evaluate the host correctly', function() {
      this.tour = new Tour;
      expect(this.tour._isRedirect('http://sub.exemple.com', '/test.html', {
        origin: 'http://exemple.com',
        href: 'http://exemple.com/test.html',
        pathname: '/test.html',
        search: '',
        hash: ''
      })).toBe(true);
      expect(this.tour._isRedirect('http://sub.exemple.com', '/test.html', {
        origin: 'http://sub.exemple.com',
        href: 'http://sub.exemple.com/test.html',
        pathname: '/test.html',
        search: '',
        hash: ''
      })).toBe(false);
      expect(this.tour._isRedirect(/http:\/\/.*\.exemple\.com/, '/test.html', {
        origin: 'http://sub.exemple.com',
        href: 'http://sub.exemple.com/test.html',
        pathname: '/test.html',
        search: '',
        hash: ''
      })).toBe(false);
      return expect(this.tour._isRedirect(/http:\/\/exemple\.com/, '/test.html', {
        origin: 'http://sub.exemple.com',
        href: 'http://sub.exemple.com/test.html',
        pathname: '/test.html',
        search: '',
        hash: ''
      })).toBe(true);
    });
    it('with `onNext` option should run the callback before showing the next step', function() {
      var tour_test;
      tour_test = 0;
      this.tour = new Tour({
        onNext: function() {
          return tour_test += 2;
        }
      });
      $('<div id="element-1"></div>').appendTo('body');
      $('<div id="element-2"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2'
      });
      this.tour.start();
      this.tour.next();
      return expect(tour_test).toBe(2);
    });
    it('`showStep` should not show step if tour ended', function() {
      this.tour = new Tour({
        onNext: function(t) {
          return t.end();
        }
      });
      $('<div id="element-1"></div>').appendTo('body');
      $('<div id="element-2"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2'
      });
      this.tour.start();
      this.tour.next();
      return expect($('.popover').length).toBe(0);
    });
    it('`addStep` with onNext option should run the callback before showing the next step', function() {
      var tour_test;
      tour_test = 0;
      $('<div id="element-1"></div>').appendTo('body');
      this.tour = new Tour;
      this.tour.addStep({
        element: '#element-1',
        onNext: function() {
          return tour_test = 2;
        }
      });
      this.tour.addStep({
        element: '#element-2'
      });
      this.tour.start();
      expect(tour_test).toBe(0);
      this.tour.next();
      return expect(tour_test).toBe(2);
    });
    it('with `onPrev` option should run the callback before showing the prev step', function() {
      var tour_test;
      tour_test = 0;
      this.tour = new Tour({
        onPrev: function() {
          return tour_test += 2;
        }
      });
      $('<div id="element-1"></div>').appendTo('body');
      $('<div id="element-2"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2'
      });
      this.tour.start();
      this.tour.next();
      this.tour.prev();
      return expect(tour_test).toBe(2);
    });
    it('`addStep` with `onPrev` option should run the callback before showing the prev step', function() {
      var tour_test;
      tour_test = 0;
      $('<div id="element-1"></div>').appendTo('body');
      $('<div id="element-2"></div>').appendTo('body');
      this.tour = new Tour;
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2',
        onPrev: function() {
          return tour_test = 2;
        }
      });
      this.tour.start();
      expect(tour_test).toBe(0);
      this.tour.next();
      this.tour.prev();
      return expect(tour_test).toBe(2);
    });
    it('with `onRedirectError` option should run the callback when redirection failed', function() {
      var tour_test;
      tour_test = 0;
      $('<div id="element-1"></div>').appendTo('body');
      this.tour = new Tour;
      this.tour.addStep({
        element: '#element-1',
        path: '/path',
        onRedirectError: function() {
          return tour_test = 2;
        }
      });
      this.tour._setState('redirect_to', 0);
      this.tour.start();
      return expect(tour_test).toBe(2);
    });
    it('should render custom navigation template', function() {
      this.tour = new Tour({
        template: '<div class="popover tour"> <div class="arrow"></div> <h3 class="popover-header"></h3> <div class="popover-body"></div> <div class="popover-navigation"> <a data-role="prev"></a> <a data-role="next"></a> <a data-role="end"></a> </div> </div>'
      });
      this.tour.start();
      $('<div id="element-1"></div>').appendTo('body');
      $('<div id="element-2"></div>').appendTo('body');
      $('<div id="element-3"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2'
      });
      this.tour.addStep({
        element: '#element-3'
      });
      this.tour.start();
      this.tour.next();
      return expect($('.popover .popover-navigation a').length).toBe(3);
    });
    it('should have `data-role` attribute for navigation template', function() {
      var template;
      this.tour = new Tour;
      template = $(this.tour._options.template);
      expect(template.find('*[data-role=next]').length).toBe(1);
      expect(template.find('*[data-role=prev]').length).toBe(1);
      return expect(template.find('*[data-role=end]').length).toBe(1);
    });
    it('should unbind click events when hiding step (in reflex mode)', function() {
      var $element;
      $element = $('<div id="element-1"></div>').appendTo('body');
      $('<div id="element-2"></div>').appendTo('body');
      this.tour = new Tour;
      this.tour.addStep({
        element: '#element-1',
        reflex: true
      });
      this.tour.addStep({
        element: '#element-2'
      });
      expect($._data($element[0], 'events')).not.toBeDefined();
      this.tour.start();
      expect($._data($element[0], 'events').click.length).toBeGreaterThan(0);
      expect($._data($element[0], 'events').click[0].namespace).toBe("tour-" + this.tour._options.name);
      return $.each([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], (function(_this) {
        return function() {
          _this.tour.next();
          expect($._data($element[0], 'events')).not.toBeDefined();
          _this.tour.prev();
          expect($._data($element[0], 'events').click.length).toBeGreaterThan(0);
          return expect($._data($element[0], 'events').click[0].namespace).toBe("tour-" + _this.tour._options.name);
        };
      })(this));
    });
    it('should add `tour-{tourName}` and `tour-{tourName}-{stepId}` classses to the popover', function() {
      this.tour = new Tour;
      $('<div id="element-1"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.showStep(0);
      expect($('.popover').hasClass("tour-" + this.tour._options.name)).toBe(true);
      return expect($('.popover').hasClass("tour-" + this.tour._options.name + "-0")).toBe(true);
    });
    it('should add `tour-{tourName}-element` and `tour-{tourName}-{stepId}-element` classses to the popover element', function() {
      var $element;
      this.tour = new Tour;
      $element = $('<div id="element-1"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.showStep(0);
      expect($element.hasClass("tour-" + this.tour._options.name + "-element")).toBe(true);
      return expect($element.hasClass("tour-" + this.tour._options.name + "-0-element")).toBe(true);
    });
    it('should show orphan steps', function() {
      this.tour = new Tour;
      this.tour.addStep({
        orphan: true
      });
      this.tour.showStep(0);
      expect($('.popover').length).toBe(1);
      return $('.popover').remove();
    });
    it('should add `orphan` class to the popover', function() {
      this.tour = new Tour;
      this.tour.addStep({
        orphan: true
      });
      this.tour.showStep(0);
      expect($('.popover').hasClass('orphan')).toBe(true);
      return $('.popover').remove();
    });
    it('should use orphan template to show orphan steps', function() {
      var step, template;
      this.tour = new Tour;
      step = {
        orphan: '<div class="popover orphan-custom-template"></div>'
      };
      this.tour.addStep(step);
      template = this.tour._template(step, 0);
      return expect($(template).hasClass('orphan-custom-template')).toBe(true);
    });
    it('should not use orphan template to show steps', function() {
      var step, template;
      this.tour = new Tour;
      $('<div id="element-1"></div>').appendTo('body');
      step = {
        orphan: '<div class="popover orphan-custom-template"></div>',
        element: '#element-1'
      };
      this.tour.addStep(step);
      template = this.tour._template(step, 0);
      return expect($(template).hasClass('orphan-custom-template')).toBe(false);
    });
    it('should execute orphan template if it is a function', function() {
      var step, template;
      this.tour = new Tour;
      step = {
        orphan: function() {
          return '<div class="popover orphan-custom-template"></div>';
        }
      };
      this.tour.addStep(step);
      template = this.tour._template(step, 0);
      return expect($(template).hasClass('orphan-custom-template')).toBe(true);
    });
    it('handles quota_exceeded exceptions', function() {
      this.tour = new Tour;
      $('<div id="element-1"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      spyOn(this.tour._options.storage, 'setItem').and.callFake(function() {
        throw new Error('QUOTA_EXCEEDED_ERR', 'QUOTA_EXCEEDED_ERR: DOM Exception 22');
      });
      spyOn(this.tour, '_setState');
      this.tour._setState('test', '1');
      return expect((function(_this) {
        return function() {
          return _this.tour._setState;
        };
      })(this)).not.toThrow();
    });
    it('should not try to scroll to non-existing element', function() {
      this.tour = new Tour({
        orphan: true
      });
      this.tour.addStep({
        element: '#nonExistingElement'
      });
      this.tour.showStep(0);
      return expect($('.popover').length).toBe(1);
    });
    it('should start the timer', function() {
      this.tour = new Tour({
        duration: 5000
      });
      $('<div id="element-1"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.start();
      expect(this.tour._timer).toBeDefined();
      expect(this.tour._duration).toBeDefined();
      return window.clearTimeout(this.tour._timer);
    });
    it('should pause the timer on pause', function() {
      this.tour = new Tour({
        duration: 5000
      });
      $('<div id="element-1"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.start();
      return window.setTimeout((function(_this) {
        return function() {
          _this.tour.pause();
          expect(_this.tour._timer).toBe(null);
          return expect(_this.tour._duration).toBeGreaterThan(0).toBeLessThan(5000);
        };
      })(this), 1000);
    });
    it('should stop the timer on hideStep', function() {
      this.tour = new Tour({
        duration: 5000
      });
      $('<div id="element-1"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.start();
      this.tour.hideStep(0);
      expect(this.tour._timer).toBe(null);
      return expect(this.tour._duration).toBe(null);
    });
    it('should stop the timer on end', function() {
      this.tour = new Tour({
        duration: 5000
      });
      $('<div id="element-1"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.start();
      this.tour.end();
      expect(this.tour._timer).toBe(null);
      return expect(this.tour._duration).toBe(null);
    });
    return it('should call window.setTimeout when delay is defined', function() {
      var counter, initialTimeout;
      counter = 0;
      initialTimeout = window.setTimeout;
      window.setTimeout = function(callback, duration) {
        counter++;
        return callback();
      };
      this.tour = new Tour({
        delay: {
          show: 300,
          hide: 400
        }
      });
      $('<div id="element-1"></div>').appendTo('body');
      $('<div id="element-2"></div>').appendTo('body');
      this.tour.addStep({
        element: '#element-1'
      });
      this.tour.addStep({
        element: '#element-2'
      });
      this.tour.start();
      expect(counter).toBe(2);
      this.tour.next();
      expect(counter).toBe(4);
      this.tour.end();
      expect(counter).toBe(5);
      return window.setTimeout = initialTimeout;
    });

    /* TODO: fix $.support.transition conflict between jquery and bootstrap
    it 'should not display inactive popover upon rapid navigation', ->
       * Flag that gives signal to the async test that it should evaluate.
      $.support.transition = true
      $.fx.off = false
      isStepShown = false
    
       * Cleanup all leftover popovers from previous tests.
      $('.popover').remove()
    
       * Setup two-step tour. The problem should occur when switching from first
       * step to the second while the transition effect of the first one is still
       * active.
      @tour = new Tour
      @tour.addStep element: $('<div></div>').appendTo('body')
      @tour.addStep
        element: $('<div></div>').appendTo('body')
        onShown: ->
          isStepShown = true
    
       * Request the first step and immediately the second one. This way the first
       * step won't be displayed when the second step is requested, so the request
       * for second step can not cleanup existing popovers yet.
      runs ->
        @tour.goTo(0)
        @tour.goTo(1)
      waitsFor ->
        isStepShown
      , 'The second step should be displayed.', 1000
      runs -> expect($('.popover').length).toBe 1
     */
  });

}).call(this);
