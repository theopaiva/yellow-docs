// Mava web chat widget (support chat / tickets).
// Mintlify runs every .js file in the repo on every page, after the page is interactive,
// so the widget script is injected here instead of being pasted into <head>.
// The data-token is Mava's public web chat token. It is not an API key and is safe to publish.
(function () {
  if (document.getElementById('MavaWebChat')) return;

  var script = document.createElement('script');
  script.defer = true;
  script.src = 'https://widget.mava.app';
  script.id = 'MavaWebChat';
  script.setAttribute('widget-version', 'v2');
  script.setAttribute('enable-sdk', 'false');
  script.setAttribute('data-token', '7f1d0f58665bae8e111f768ae7958f3543e578b5f40798d1b6000a9324d304f4');
  document.head.appendChild(script);
})();
