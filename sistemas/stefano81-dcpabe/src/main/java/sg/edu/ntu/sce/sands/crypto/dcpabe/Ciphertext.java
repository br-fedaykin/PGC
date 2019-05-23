package sg.edu.ntu.sce.sands.crypto.dcpabe;

import sg.edu.ntu.sce.sands.crypto.dcpabe.ac.AccessStructure;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonValue;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;


public class Ciphertext implements Serializable {
    private static final long serialVersionUID = 1L;
    private byte[] c0;
    private List<byte[]> c1;
    private List<byte[]> c2;
    private List<byte[]> c3;
    private AccessStructure accessStructure;
    
    public Ciphertext() {
        c1 = new ArrayList<byte[]>();
        c2 = new ArrayList<byte[]>();
        c3 = new ArrayList<byte[]>();
    }

    public byte[] getC0() {
        return c0;
    }

    public void setC0(byte[] c0) {
        this.c0 = c0;
    }

    public byte[] getC1(int x) {
        return c1.get(x);
    }

    public List<byte[]> getC1() {
        return c1;
    }

    public void setC1(byte[] c1x) {
        c1.add(c1x);
    }
    
    public byte[] getC2(int x) {
        return c2.get(x);
    }

    public List<byte[]> getC2() {
        return c2;
    }

    public void setC2(byte[] c2x) {
        c2.add(c2x);
    }

    public List<byte[]> getC3() {
        return c3;
    }

    public byte[] getC3(int x) {
        return c3.get(x);
    }

    public void setC3(byte[] c3x) {
        c3.add(c3x);
    }

    public AccessStructure getAccessStructure() {
        return accessStructure;
    }

    public void setAccessStructure(AccessStructure accessStructure) {
        this.accessStructure = accessStructure;
    }

    @Override
    public String toString() {        
        ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
        try {
            return ow.writeValueAsString(this);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return "error";
    }
}
