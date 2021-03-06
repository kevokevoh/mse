import * as React from 'react';
import { ListItem } from "material-ui/List";
import Keyrune from '../keyrune';
import ContentSend from 'material-ui/svg-icons/content/send';

import { Link } from 'react-router-dom';

interface IProps {
  card: {
    id: number,
    name: string,
    set: { name: string },
  }
};

class Item extends React.Component<IProps, any> {
  render() {
    const card = this.props.card;
    const url = `/cards/${card.id}`;

    return <Link to={url}>
      <ListItem
        primaryText={card.name}
        secondaryText={card.set.name}
      />
    </Link>;
  }
}

export default Item
