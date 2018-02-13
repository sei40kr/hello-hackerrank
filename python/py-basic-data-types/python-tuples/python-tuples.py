if __name__ == '__main__':
    n = int(raw_input())
    ans = hash(tuple(map(int, raw_input().split())))
    print(ans)
