window.onerror = function(msg, url, line) {
  if(onerror.num++ < onerror.max) {
    alert("ОШИБКА: " + msg + "\n" + url + ":" + line);
  }
};
onerror.max = 3;
onerror.num = 0;