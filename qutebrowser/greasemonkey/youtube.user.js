// ==UserScript==
// @name         Auto Skip YouTube Ads
// @version      1.1.0
// @description  Speed up and skip YouTube ads automatically
// @author       jso8910 and others
// @match        *://*.youtube.com/*
// ==/UserScript==


document.addEventListener('load', () => {
    const ignoreBtn = document.querySelector('button.ytp-skip-ad-button')
    if (ignoreBtn) {
      ignoreBtn.click()
    }
    const ad = [...document.querySelectorAll('.ad-showing')][0];
    if (ad) {
        document.querySelector('video').currentTime = 9999999999;
    }
}, true);
