package com.dcpabe.web.client.ac;

import com.nkdata.gwt.streamer.client.Streamable;

public abstract class TreeNode implements Streamable {
	private static final long serialVersionUID = 1L;
	protected String label;
	protected transient int sat;
	protected InternalNode parent;
	
	//TODO: find some other alternative, right now using hard-coded theoretical maximum
	transient public int satisfied_num = 2147483647;
	transient public TreeNode full_satisfied = null;
	
	abstract String getName();
	
	public TreeNode(){}
	
	public int getSat() {
		return sat;
	}

	public void setSat(int i) {
		this.sat = i;
	}
	
	public InternalNode getParent() {
		return parent;
	}

	public TreeNode setParent(TreeNode i) {
		this.parent = (InternalNode) i;
		return this;
	}
	
	public String getLabel() {
		return label;
	}
	
	public void setLabel(String label) {
		this.label = label;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((label == null) ? 0 : label.hashCode());
		result = prime * result + sat;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof TreeNode))
			return false;
		TreeNode other = (TreeNode) obj;
		if (label == null) {
			if (other.label != null)
				return false;
		} else if (!label.equals(other.label))
			return false;
		if (sat != other.sat)
			return false;
		return true;
	}
}