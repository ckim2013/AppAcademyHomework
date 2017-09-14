import React from 'react';

import GiphysIndexItem from './giphys_index_item';

function GiphysIndex({giphys}) {
  return (
    <div>
      {giphys.map((gif, idx) => <GiphysIndexItem key={idx} gif={gif} />)}
    </div>
  );
}

export default GiphysIndex;
