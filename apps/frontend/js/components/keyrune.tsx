import * as React from "react";

interface KeyruneProps {
  id?: string,
  className?: string,
}

const Keyrune = ({ id, className }: KeyruneProps) => {
  if (!id) {
    return null;
  }

  const classes = `ss ss-2x ss-${id.toString().toLowerCase()} ${className}`;

  return <i className={classes} />;
}

export default Keyrune;
