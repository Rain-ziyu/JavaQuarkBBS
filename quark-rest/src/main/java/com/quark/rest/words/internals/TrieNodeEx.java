package com.quark.rest.words.internals;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

public class TrieNodeEx {
    public Integer Char;
    public boolean End;
    public Integer Index;
    public List<Integer> Results;
    public Map<Integer, TrieNodeEx> m_values;
    private Integer minflag = Integer.MAX_VALUE;
    private Integer maxflag = 0;
    public int Next;

    public TrieNodeEx() {
        m_values = new Hashtable<Integer, TrieNodeEx>();
        Results = new ArrayList<Integer>();
    }

    public void Add(int c, TrieNodeEx node3) {
        if (minflag > c) {
            minflag = c;
        }
        if (maxflag < c) {
            maxflag = c;
        }
        m_values.put(c, node3);
    }

    public void SetResults(Integer text) {
        if (End == false) {
            End = true;
        }
        if (Results.contains(text) == false) {
            Results.add(text);
        }
    }

    public boolean HasKey(Integer c) {
        if (minflag <= c && maxflag >= c) {
            return m_values.containsKey((int) c);
        }
        return false;
    }

    public void Rank(Integer oneStart, Integer start, boolean[] seats, boolean[] seats2, Integer[] has) {
        if (maxflag == 0)
            return;
        if (minflag == maxflag) {
            RankOne(oneStart, seats, has);
            return;
        }
        List<Integer> keys = new ArrayList<Integer>();
        m_values.forEach((k, v) -> {
            keys.add((int) k);
        });

        Integer length = keys.size() - 1;
        int[] moves = new int[keys.size() - 1];
        for (int i = 1; i < keys.size(); i++) {
            moves[i - 1] = maxflag - keys.get(i);
        }

        while (has[start] != null) {
            start++;
        }
        Integer s = start < minflag ? minflag : start;

        int next = s - minflag;
        int e = next + maxflag;
        while (e < has.length) {
            if (seats2[e] == false && seats[next] == false) {
                boolean isok = true;
                for (int i = 0; i < keys.size(); i++) {
                    int position = next + keys.get(i);
                    if (has[position] != null) {
                        for (int j = 0; j < length; j++) {
                            seats2[position + moves[j]] = true;
                        }
                        isok = false;
                        break;
                    }
                }
                if (isok) {
                    SetSeats(next, seats, has);
                    start += keys.size() / 2;
                    for (int p = start; p < e + maxflag - start + 1; p++) {
                        if (seats2[p] == true) {
                            seats2[p] = false;
                        }
                    }
                    return;
                }
            }
            next++;
            e++;
        }
    }

    private void RankOne(Integer start, boolean[] seats, Integer[] has) {
        while (has[start] != null) {
            start++;
        }
        Integer s = start < minflag ? minflag : start;

        for (Integer i = s; i < has.length; i++) {
            if (has[i] == null) {
                Integer next = i - (Integer) minflag;
                if (seats[next])
                    continue;
                SetSeats(next, seats, has);
                break;
            }
        }
        start++;
    }

    private void SetSeats(Integer next, boolean[] seats, Integer[] has) {
        Next = next;
        seats[next] = true;

        m_values.forEach((key, value) -> {
            int position = next + key;
            has[position] = value.Index;
        });
    }

}