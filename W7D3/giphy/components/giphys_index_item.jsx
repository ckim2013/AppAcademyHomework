import React from 'react';

function GiphysIndexItem({gif}) {
  const url = gif.images.fixed_height.url;
  console.log(url);
  return (
      <img src={url} />
  );
}

export default GiphysIndexItem;
