pragma solidity ^0.4.18;

/**
 * @title Otoshidama
 * @dev Otoshidata は ERC20 準拠のトークン実装です
 * @dev Based on code by https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/token/StandardToken.sol
 */
contract Otoshidama {

  // @dev トークンのメタ情報を設定します
  string public name = 'Otoshidama';
  string public symbol = 'OTD';
  uint public decimals = 18;

  // @dev トークンの合計供給量を保持します
  uint public totalSupply;

  // @dev 各アカウントの残高を保持します
  mapping(address => uint) public balances;

  /**
   * @dev コントラクトを初期化します
   */
  function Otoshidama() public {
    uint _initialSupply = 10000;

    balances[msg.sender] = _initialSupply;
    totalSupply = _initialSupply;
  }

  /**
   * @dev トークンの合計供給量を取得します
   * @return トークンの合計供給量を表す uint 値
   */
  function totalSupply() public view returns (uint) {
    return totalSupply;
  }

  /**
   * @dev 特定のアカウントの残高を取得します
   * @param _owner 残高を取得するアカウントのアドレス
   * @return 渡されたアドレスが所有する残高を表す uint 値
   */
  function balanceOf(address _owner) public view returns (uint) {
    return balances[_owner];
  }

  /**
   * @dev 特定のアカウントに指定した量のトークンを転送します
   * @param _to トークンを転送するアカウントのアドレス
   * @param _value 転送するトークンの量
   * @return トークンの転送が成功したかどうかを表す bool 値
   */
  function transfer(address _to, uint _value) public returns (bool) {
    require(_value <= balances[msg.sender]);

    balances[msg.sender] -= _value;
    balances[_to] += _value;

    Transfer(msg.sender, _to, _value);
    return true;
  }

  event Transfer(address indexed from, address indexed to, uint value);
}
