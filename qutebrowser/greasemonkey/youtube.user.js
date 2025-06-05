// ==UserScript==
// @name         Auto Skip YouTube Ads
// @version      1.1.0
// @description  Speed up and skip YouTube ads automatically
// @author       jso8910 and others
// @match        *://*.youtube.com/*
// ==/UserScript==


document.addEventListener('DOMContentLoaded', () => {
  const ytHost = 'www.youtube.com'

  console.log('window.location.hostname',window.location.hostname )
  if (window.location.hostname === ytHost) {
    const body = document.querySelector('body');
    body.setAttribute('style', 'height: 100vh; width: 100vw; display: flex; flex-direction: column; justify-content: center; align-items: center;');
    const pageContent = document.createElement('div');
    const title = document.createElement('h1');
    title.textContent = 'Go back to work!';
    pageContent.appendChild(title);
    body.innerHTML = '';
    body.appendChild(pageContent);
  }

  /* const ignoreBtn = document.querySelector('button.ytp-skip-ad-button') */
  /* if (ignoreBtn) { */
  /*   ignoreBtn.click() */
  /* } */
  /* const ad = [...document.querySelectorAll('.ad-showing')][0]; */
  /* if (ad) { */
  /*     document.querySelector('video').currentTime = 9999999999; */
  /* } */
}, true);
