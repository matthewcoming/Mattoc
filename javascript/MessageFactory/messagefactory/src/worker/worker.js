function worker(count) {
  let x = count;
  window.postMessage(
    {'count':x},
    '*'
  );
  setTimeout( () => {
    worker(count + 1);
  }, 1000);
}

export default worker;
